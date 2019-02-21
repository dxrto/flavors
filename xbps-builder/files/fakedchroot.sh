#!/bin/sh
#
# This chroot script uses bad design
#
fake_mount() {
  #
  # Fake mount works by removing the dir, and replacing it with a symlink
  # This created the illusion of a bind.
  #

  local FROM="$1";
  local TO="$2"
  if [ -d "$TO" ]; then
    rmdir "$TO";
  fi
  ln -s "$FROM" "$TO";
}

fake_umount() {
  #
  # Remove the symlink and recreate the dir
  #
  rm "$1";
  mkdir "$1";
}

readonly MASTERDIR="$1"
readonly DISTDIR="$2"
readonly HOSTDIR="$3"
readonly EXTRA_ARGS="$4"
readonly CMD="$5"
shift 5

if [ -z "$MASTERDIR" -o -z "$DISTDIR" ]; then
	echo "$0 MASTERDIR/DISTDIR not set"
	exit 1
fi

fake_mount $DISTDIR $MASTERDIR/void-packages;

if [ ! -z "$HOSTDIR" ]; then
  fake_mount $HOSTDIR $MASTERDIR/host;
fi

ITEMS="";
# xbps-src may send some other binds, parse them here
while getopts 'b:' c -- "$EXTRA_ARGS"; do
  # Skip everything that's not a bind
  [ "$c" = "b" ] || continue;

  _FROM="$(cut -d: -f1 <<< "$OPTARG")";
  _TO="$(cut -d: -f2 <<< "$OPTARG")";
  fake_mount "${_FROM}" "${_TO}";
  # Save created mounts so we can clean them up later
  ITEMS+="${_TO} "
done

CURR_DIR="${PWD}";
# To give the illusion we entered the chroot, cd to /
cd /;
# Tell xbps-src that we are "in the chroot".
IN_CHROOT=1 $CMD $@;
# Save exit code for after clean up
X="$?";
# cd back to the old pwd, so everything is the same again
cd "$CURR_DIR";

if [ ! -z "$HOSTDIR" ]; then
  fake_umount $MASTERDIR/host;
fi

fake_umount $MASTERDIR/void-packages;

# "umount" on demand created "mounts"
for i in $ITEMS; do
  fake_umount "$i";
done

# Exit with the returned exit code
exit "$X";
