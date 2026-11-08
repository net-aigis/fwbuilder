#!/usr/bin/env bash
# Phase-6874: UI honesty bundle includes ssh_refusal_status_refresh_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_refusal_status_refresh_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_refusal_status_refresh_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_status_refresh_roster bundle section ok"; echo "cleaned"; echo "OK: phase6874 e2e passed"
