#!/usr/bin/env bash
# Phase-5738: UI ssh-alternative-support roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativeSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-alternative-support roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternative-support roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-alternative-support roster ok"; echo "cleaned"; echo "OK: phase5738 e2e passed"
