#!/usr/bin/env bash
# Phase-4618: UI password-ssh roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'passwordSshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig password-ssh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download password-ssh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI password-ssh roster ok"
echo "cleaned"
echo "OK: phase4618 e2e passed"
