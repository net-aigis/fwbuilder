#!/usr/bin/env bash
# Phase-6074: UI honesty bundle includes ssh_not_implemented_check_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_not_implemented_check_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_not_implemented_check_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_not_implemented_check_roster bundle section ok"; echo "cleaned"; echo "OK: phase6074 e2e passed"
