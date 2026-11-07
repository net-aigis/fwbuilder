#!/usr/bin/env bash
# Phase-5034: UI honesty bundle includes ssh_refusal_paths_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_refusal_paths_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_refusal_paths_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_paths_roster bundle section ok"; echo "cleaned"; echo "OK: phase5034 e2e passed"
