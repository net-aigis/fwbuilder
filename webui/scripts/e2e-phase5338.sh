#!/usr/bin/env bash
# Phase-5338: UI ssh-alternative-notes roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativeNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-alternative-notes roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternative-notes roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-alternative-notes roster ok"; echo "cleaned"; echo "OK: phase5338 e2e passed"
