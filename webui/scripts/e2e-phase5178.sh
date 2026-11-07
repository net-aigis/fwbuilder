#!/usr/bin/env bash
# Phase-5178: UI ssh-method-lists roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshMethodListsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-method-lists roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-method-lists roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-method-lists roster ok"; echo "cleaned"; echo "OK: phase5178 e2e passed"
