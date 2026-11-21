#!/usr/bin/env bash
# Phase-4954: UI honesty bundle includes ssh_alternatives_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_alternatives_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_alternatives_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternatives_roster bundle section ok"; echo "cleaned"; echo "OK: phase4954 e2e passed"
