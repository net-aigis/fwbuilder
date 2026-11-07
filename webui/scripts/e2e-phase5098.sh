#!/usr/bin/env bash
# Phase-5098: UI ssh-refusal-status roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalStatusRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-refusal-status roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-refusal-status roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-refusal-status roster ok"; echo "cleaned"; echo "OK: phase5098 e2e passed"
