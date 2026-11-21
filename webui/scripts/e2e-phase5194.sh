#!/usr/bin/env bash
# Phase-5194: UI honesty bundle includes ssh_method_lists_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_method_lists_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_method_lists_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_method_lists_roster bundle section ok"; echo "cleaned"; echo "OK: phase5194 e2e passed"
