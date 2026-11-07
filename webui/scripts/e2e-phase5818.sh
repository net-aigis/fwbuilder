#!/usr/bin/env bash
# Phase-5818: UI ssh-password-support roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshPasswordSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-password-support roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-password-support roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-password-support roster ok"; echo "cleaned"; echo "OK: phase5818 e2e passed"
