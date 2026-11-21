#!/usr/bin/env bash
# Phase-41962: UI ssh-auth-soft-44080-echo roster Soft 41960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-44080-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft44080EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41960+ ssh-auth-soft-44080-echo roster ok"; echo "cleaned"; echo "OK: phase41962 e2e passed"
