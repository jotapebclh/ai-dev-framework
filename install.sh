#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
AI Development Framework installer

Usage:
  install.sh [target-dir] [--dry-run] [--force]
  install.sh --help

Arguments:
  target-dir    Project directory to install into. Defaults to current directory.

Options:
  --dry-run     Show what would be copied without changing files.
  --force       Overwrite existing framework files in the target directory.
  -h, --help    Show this help message.

Examples:
  install.sh .
  install.sh /path/to/project --dry-run
  install.sh /path/to/project --force
USAGE
}

die() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

TARGET_DIR='.'
TARGET_SET=0
DRY_RUN=0
FORCE=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      ;;
    --force)
      FORCE=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      if [ "$#" -gt 0 ]; then
        [ "$TARGET_SET" -eq 0 ] || die 'Only one target directory is allowed.'
        TARGET_DIR="$1"
        TARGET_SET=1
      fi
      ;;
    -*)
      die "Unknown option: $1"
      ;;
    *)
      [ "$TARGET_SET" -eq 0 ] || die 'Only one target directory is allowed.'
      TARGET_DIR="$1"
      TARGET_SET=1
      ;;
  esac
  shift
done

[ -d "$TARGET_DIR" ] || die "Target directory does not exist: $TARGET_DIR"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
TEMPLATE_DIR="$SCRIPT_DIR/template"
TARGET_DIR="$(cd -- "$TARGET_DIR" && pwd -P)"

[ -d "$TEMPLATE_DIR" ] || die "Template directory not found: $TEMPLATE_DIR"
[ -d "$TEMPLATE_DIR/.ai" ] || die "Invalid template: missing $TEMPLATE_DIR/.ai"

shopt -s dotglob nullglob
ENTRIES=()
CONFLICTS=()

for source_path in "$TEMPLATE_DIR"/*; do
  entry_name="$(basename -- "$source_path")"
  ENTRIES+=("$entry_name")

  if [ -e "$TARGET_DIR/$entry_name" ]; then
    CONFLICTS+=("$entry_name")
  fi
done

[ "${#ENTRIES[@]}" -gt 0 ] || die "Template directory is empty: $TEMPLATE_DIR"

printf 'Installing AI Development Framework\n'
printf 'Source: %s\n' "$TEMPLATE_DIR"
printf 'Target: %s\n' "$TARGET_DIR"
printf '\n'

if [ "${#CONFLICTS[@]}" -gt 0 ] && [ "$FORCE" -ne 1 ]; then
  printf 'Refusing to overwrite existing target paths:\n' >&2
  for conflict in "${CONFLICTS[@]}"; do
    printf '  - %s\n' "$conflict" >&2
  done
  printf '\nUse --force to overwrite, or choose an empty target directory.\n' >&2
  exit 1
fi

if [ "$DRY_RUN" -eq 1 ]; then
  printf 'Dry run: no files will be changed.\n'
  printf 'Would copy:\n'
  for entry in "${ENTRIES[@]}"; do
    if [ -e "$TARGET_DIR/$entry" ]; then
      printf '  - %s (overwrite)\n' "$entry"
    else
      printf '  - %s\n' "$entry"
    fi
  done
  exit 0
fi

cp -a "$TEMPLATE_DIR/." "$TARGET_DIR/"

printf 'Installed successfully.\n'
printf '\nNext steps:\n'
printf '1. Open the project directory with your AI coding tool.\n'
printf '2. Ask it to read AI_CONTEXT.md.\n'
printf '3. Fill or let the AI help fill .ai/config.json, .ai/ref/dependencies.md, and .ai/ref/env.md.\n'
printf '4. Read .ai/FRAMEWORK_GUIDE.md for framework usage details.\n'
printf '\nExample prompt:\n'
printf 'Read AI_CONTEXT.md. Quero criar este projeto do zero. Me conduza pelas decisões iniciais.\n'
