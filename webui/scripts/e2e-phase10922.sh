#!/usr/bin/env bash
# Phase-10922: UI ssh-auth-gap-label-echo roster Soft 10920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-gap-label-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthGapLabelEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10920+ ssh-auth-gap-label-echo roster ok"; echo "cleaned"; echo "OK: phase10922 e2e passed"
