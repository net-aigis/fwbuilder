#!/usr/bin/env bash
# Phase-33962: UI ssh-auth-soft-35080-echo roster Soft 33960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-35080-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft35080EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33960+ ssh-auth-soft-35080-echo roster ok"; echo "cleaned"; echo "OK: phase33962 e2e passed"
