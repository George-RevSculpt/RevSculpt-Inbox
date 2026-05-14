#!/bin/bash
# RevSculpt Inbox — v1.2.0
# revsculpt.com

set -euo pipefail

# ── Config ────────────────────────────────────────────────────
RELEASE_URL="https://raw.githubusercontent.com/George-RevSculpt/RevSculpt-Inbox/main"
INSTALL_DIR="$HOME/.claude/skills/revsculpt-inbox"
HOOK_DIR="$HOME/.claude/hooks"
CONFIG_PATH="$HOME/.claude/settings.json"
TOOL_VERSION="1.2.0"

# ── Terminal colors ───────────────────────────────────────────
R='\033[0;31m'
G='\033[0;32m'
C='\033[0;36m'
W='\033[1;37m'
D='\033[2m'
B='\033[1m'
N='\033[0m'

# ── Step counter ──────────────────────────────────────────────
STEP=0
step() {
  STEP=$((STEP + 1))
  printf "\n  ${D}[${STEP}]${N} ${W}${1}${N}\n"
}

ok()   { printf "      ${G}✓${N}  ${D}${1}${N}\n"; }
fail() { printf "      ${R}✗${N}  ${1}\n"; exit 1; }

# ── Fetch helper ──────────────────────────────────────────────
fetch() {
  local src="$1" dest="$2"
  if command -v curl &>/dev/null; then
    curl -fsSL --proto '=https' --max-redirs 3 "$src" -o "$dest" || fail "Download failed: $src"
  elif command -v wget &>/dev/null; then
    wget -q --https-only "$src" -O "$dest" 2>/dev/null || \
    wget -q "$src" -O "$dest" || fail "Download failed: $src"
  else
    fail "curl or wget required — neither found"
  fi
}

# ── Merge hook into settings.json ─────────────────────────────
wire_hook() {
  local hook_cmd="bash '${HOOK_DIR}/revsculpt-inbox-active.sh'"
  local matcher="spam|deliverability|trigger word|banned word|check my email|check my copy|scan this|review this email|will this get flagged|is this spammy|cold email|subject line|sequence|linkedin dm|outreach copy|rewrite.*email|clean.*copy"

  if command -v python3 &>/dev/null; then
    # Pass all values via environment — never interpolate shell vars into Python source
    RI_CFG="$CONFIG_PATH" RI_MATCHER="$matcher" RI_CMD="$hook_cmd" python3 - <<'PYEOF'
import json, os

cfg_path = os.environ['RI_CFG']
matcher  = os.environ['RI_MATCHER']
hook_cmd = os.environ['RI_CMD']

cfg = {}
if os.path.isfile(cfg_path):
    try:
        with open(cfg_path, 'r') as f:
            cfg = json.load(f)
    except (json.JSONDecodeError, OSError):
        cfg = {}

entry = {
    "matcher": matcher,
    "hooks": [{"type": "command", "command": hook_cmd}]
}

cfg.setdefault('hooks', {}).setdefault('UserPromptSubmit', [])

if not any(h.get('matcher') == entry['matcher'] for h in cfg['hooks']['UserPromptSubmit']):
    cfg['hooks']['UserPromptSubmit'].append(entry)

with open(cfg_path, 'w') as f:
    json.dump(cfg, f, indent=2)
PYEOF
  else
    # Fallback: write fresh config (only runs if python3 is absent)
    mkdir -p "$(dirname "$CONFIG_PATH")"
    printf '%s\n' '{
  "hooks": {
    "UserPromptSubmit": [
      {
        "matcher": "spam|deliverability|trigger word|banned word|check my email|scan this|cold email|outreach copy",
        "hooks": [
          {"type": "command", "command": "bash '"'"'${HOOK_DIR}/revsculpt-inbox-active.sh'"'"'"}
        ]
      }
    ]
  }
}' > "$CONFIG_PATH"
  fi
}

# ─────────────────────────────────────────────────────────────
clear

printf "\n"
printf "${W}"
printf "  ██████╗ ███████╗██╗   ██╗███████╗ ██████╗██╗   ██╗██╗     ██████╗ ████████╗\n"
printf "  ██╔══██╗██╔════╝██║   ██║██╔════╝██╔════╝██║   ██║██║     ██╔══██╗╚══██╔══╝\n"
printf "  ██████╔╝█████╗  ██║   ██║███████╗██║     ██║   ██║██║     ██████╔╝   ██║   \n"
printf "  ██╔══██╗██╔══╝  ╚██╗ ██╔╝╚════██║██║     ██║   ██║██║     ██╔═══╝    ██║   \n"
printf "  ██║  ██║███████╗ ╚████╔╝ ███████║╚██████╗╚██████╔╝███████╗██║        ██║   \n"
printf "  ╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚══════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝        ╚═╝   \n"
printf "${N}\n"
printf "            ${W}██╗███╗   ██╗██████╗  ██████╗ ██╗  ██╗${N}\n"
printf "            ${W}██║████╗  ██║██╔══██╗██╔═══██╗╚██╗██╔╝${N}\n"
printf "            ${W}██║██╔██╗ ██║██████╔╝██║   ██║ ╚███╔╝ ${N}\n"
printf "            ${W}██║██║╚██╗██║██╔══██╗██║   ██║ ██╔██╗ ${N}\n"
printf "            ${W}██║██║ ╚████║██████╔╝╚██████╔╝██╔╝ ██╗${N}\n"
printf "            ${W}╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝${N}\n"
printf "\n"
printf "  ${D}Cold Email Deliverability Skill · v${TOOL_VERSION} · revsculpt.com${N}\n"
printf "\n  ${D}$(printf '─%.0s' {1..72})${N}\n"
sleep 0.5

# ── Preflight ─────────────────────────────────────────────────
step "Checking environment"

command -v claude &>/dev/null || fail "Claude Code not found. Install it at https://claude.ai/code"
ok "Claude Code detected"

{ command -v curl &>/dev/null || command -v wget &>/dev/null; } || fail "curl or wget required"
ok "Download tool available"

# ── Directories ───────────────────────────────────────────────
step "Creating directories"
mkdir -p "$INSTALL_DIR" "$HOOK_DIR"
ok "$INSTALL_DIR"
ok "$HOOK_DIR"

# ── Files ─────────────────────────────────────────────────────
step "Downloading skill files"

fetch "$RELEASE_URL/revsculpt-inbox.md"  "$INSTALL_DIR/SKILL.md"
ok "SKILL.md  (six-layer scan engine)"

fetch "$RELEASE_URL/triggerwords.md"     "$INSTALL_DIR/triggerwords.md"
ok "triggerwords.md  (400+ tokens · 8 risk clusters)"

fetch "$RELEASE_URL/.claude/hooks/revsculpt-inbox-active.sh" "$HOOK_DIR/revsculpt-inbox-active.sh"
chmod +x "$HOOK_DIR/revsculpt-inbox-active.sh"
ok "revsculpt-inbox-active.sh  (smart activation hook)"

# ── Hook wiring ───────────────────────────────────────────────
step "Wiring activation hook"
wire_hook
ok "Hook registered in $CONFIG_PATH"
ok "Fires only on deliverability-related prompts"

# ── Done ──────────────────────────────────────────────────────
printf "\n  ${D}$(printf '─%.0s' {1..72})${N}\n\n"
printf "  ${G}${B}Installed successfully.${N}\n\n"

printf "  ${W}Usage${N}\n"
printf "  ${D}Open Claude Code and type:${N}  ${C}/revsculpt-inbox${N}\n"
printf "  ${D}Paste your subject line + email body.${N}\n\n"

printf "  ${W}Scan modes${N}\n"
printf "  ${D}Email (default)   subject + body, all six layers${N}\n"
printf "  ${D}Sequence          paste multi-step sequences${N}\n"
printf "  ${D}LinkedIn DM       say 'LinkedIn' or 'DM'${N}\n"
printf "  ${D}Subject only      paste a subject line alone${N}\n\n"

printf "  ${W}What gets checked${N}\n"
printf "  ${D}Layer 1   400+ banned tokens with severity weights${N}\n"
printf "  ${D}Layer 2   35+ stale follow-up patterns + seller-centric openers${N}\n"
printf "  ${D}Layer 3   8 risk clusters including vague ROI claims${N}\n"
printf "  ${D}Layer 4   8 formatting violations${N}\n"
printf "  ${D}Layer 5   ICP buyer signal check — exclusive to RevSculpt Inbox${N}\n"
printf "  ${D}Layer 6   Zero-violation gate — runs until both scores clear${N}\n\n"

printf "  ${D}Deliverability Score 0–100 + ICP Clarity Score 0–100${N}\n"
printf "  ${D}Both must pass before a send-ready verdict is issued.${N}\n\n"

printf "  ${D}Built by RevSculpt — revsculpt.com${N}\n\n"
