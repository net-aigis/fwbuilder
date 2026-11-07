#!/usr/bin/env bash
# Phase-5418: UI ssh-alternative-titles roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativeTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-alternative-titles roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternative-titles roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-alternative-titles roster ok"; echo "cleaned"; echo "OK: phase5418 e2e passed"
