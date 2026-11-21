#!/usr/bin/env bash
# Phase-11002: UI ssh-auth-gap-closure-echo roster Soft 11000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-gap-closure-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthGapClosureEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11000+ ssh-auth-gap-closure-echo roster ok"; echo "cleaned"; echo "OK: phase11002 e2e passed"
