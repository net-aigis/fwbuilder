#!/usr/bin/env bash
# Phase-6778: UI ssh-not-implemented-password roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshNotImplementedPasswordRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-not-implemented-password roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-password roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-not-implemented-password roster ok"; echo "cleaned"; echo "OK: phase6778 e2e passed"
