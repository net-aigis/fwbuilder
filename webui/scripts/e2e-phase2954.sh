#!/usr/bin/env bash
# Phase-2954: UI honesty bundle includes ssh_honesty_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'ssh_honesty_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_honesty_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_honesty_roster bundle section ok"
echo "cleaned"
echo "OK: phase2954 e2e passed"
