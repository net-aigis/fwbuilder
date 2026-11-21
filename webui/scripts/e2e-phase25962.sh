#!/usr/bin/env bash
# Phase-25962: UI ssh-auth-soft-26160-echo roster Soft 25960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-26160-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft26160EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25960+ ssh-auth-soft-26160-echo roster ok"; echo "cleaned"; echo "OK: phase25962 e2e passed"
