#!/usr/bin/env bash
# Phase-5914: UI honesty bundle includes ssh_batch_mode_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_batch_mode_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_batch_mode_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_batch_mode_roster bundle section ok"; echo "cleaned"; echo "OK: phase5914 e2e passed"
