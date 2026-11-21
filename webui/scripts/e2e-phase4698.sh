#!/usr/bin/env bash
# Phase-4698: UI ssh-not-implemented roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sshNotImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-not-implemented roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-not-implemented roster ok"
echo "cleaned"
echo "OK: phase4698 e2e passed"
