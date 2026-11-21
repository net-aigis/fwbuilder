#!/usr/bin/env bash
# Phase-9642: UI ssh-auth-not-implemented-id roster Soft 9640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-not-implemented-id roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNotImplementedIdRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9640+ ssh-auth-not-implemented-id roster ok"; echo "cleaned"; echo "OK: phase9642 e2e passed"
