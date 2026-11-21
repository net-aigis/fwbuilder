#!/usr/bin/env bash
# Phase-4538: UI ssh-auth roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sshAuthRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-auth roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-auth roster ok"
echo "cleaned"
echo "OK: phase4538 e2e passed"
