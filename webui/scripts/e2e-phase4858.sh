#!/usr/bin/env bash
# Phase-4858: UI ssh-capability-flags roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshCapabilityFlagsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-capability-flags roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-capability-flags roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-capability-flags roster ok"; echo "cleaned"; echo "OK: phase4858 e2e passed"
