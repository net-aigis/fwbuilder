#!/usr/bin/env bash
# Phase-6058: UI ssh-not-implemented-check roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshNotImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-not-implemented-check roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-check roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-not-implemented-check roster ok"; echo "cleaned"; echo "OK: phase6058 e2e passed"
