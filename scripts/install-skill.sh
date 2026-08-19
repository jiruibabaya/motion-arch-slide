#!/usr/bin/env bash
set -euo pipefail

SCOPE="user"
AGENTS="cursor,claude,codex"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --scope) SCOPE="$2"; shift 2 ;;
    --agents) AGENTS="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: $0 [--scope user|project] [--agents cursor,claude,codex]"
      exit 0
      ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUNDLE=(SKILL.md DESIGN.md INSTALL.md references templates slides)

copy_bundle() {
  local dest="$1"
  rm -rf "$dest"
  mkdir -p "$dest"
  for item in "${BUNDLE[@]}"; do
    [[ -e "$ROOT/$item" ]] || continue
    cp -R "$ROOT/$item" "$dest/"
  done
}

target_for() {
  local agent="$1"
  local name="motion-arch-slide"
  case "$agent" in
    cursor)
      if [[ "$SCOPE" == "project" ]]; then echo "$ROOT/.cursor/skills/$name"
      else echo "$HOME/.cursor/skills/$name"; fi
      ;;
    claude)
      if [[ "$SCOPE" == "project" ]]; then echo "$ROOT/.claude/skills/$name"
      else echo "$HOME/.claude/skills/$name"; fi
      ;;
    codex)
      if [[ "$SCOPE" == "project" ]]; then echo "ERROR: Codex is user-scoped only" >&2; return 1; fi
      local codex_home="${CODEX_HOME:-$HOME/.codex}"
      echo "$codex_home/skills/$name"
      ;;
    *) echo "Unknown agent: $agent" >&2; return 1 ;;
  esac
}

IFS=',' read -ra AGENT_ARR <<< "$AGENTS"
for agent in "${AGENT_ARR[@]}"; do
  dest="$(target_for "$agent")" || continue
  copy_bundle "$dest"
  echo "Installed -> $dest"
done

echo ""
echo "Done. Restart agent chat or start a new turn."
echo "Cursor/Claude: @motion-arch-slide"
