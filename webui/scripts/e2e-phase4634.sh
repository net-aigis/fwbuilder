#!/usr/bin/env bash
# Phase-4634: UI honesty bundle includes password_ssh_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'password_ssh_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_password_ssh_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI password_ssh_roster bundle section ok"
echo "cleaned"
echo "OK: phase4634 e2e passed"
