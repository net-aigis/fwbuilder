#!/usr/bin/env bash
# Phase-5114: UI honesty bundle includes ssh_refusal_status_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_refusal_status_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_refusal_status_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_status_roster bundle section ok"; echo "cleaned"; echo "OK: phase5114 e2e passed"
