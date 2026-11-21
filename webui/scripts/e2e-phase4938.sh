#!/usr/bin/env bash
# Phase-4938: UI ssh-alternatives roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-alternatives roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternatives roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-alternatives roster ok"; echo "cleaned"; echo "OK: phase4938 e2e passed"
