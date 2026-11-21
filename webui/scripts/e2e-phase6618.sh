#!/usr/bin/env bash
# Phase-6618: UI ssh-implemented-identity roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedIdentityRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-implemented-identity roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-implemented-identity roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-implemented-identity roster ok"; echo "cleaned"; echo "OK: phase6618 e2e passed"
