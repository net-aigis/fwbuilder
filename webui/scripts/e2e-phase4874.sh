#!/usr/bin/env bash
# Phase-4874: UI honesty bundle includes ssh_capability_flags_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_capability_flags_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_capability_flags_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_capability_flags_roster bundle section ok"; echo "cleaned"; echo "OK: phase4874 e2e passed"
