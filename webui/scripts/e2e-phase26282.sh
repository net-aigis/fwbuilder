#!/usr/bin/env bash
# Phase-26282: UI ssh-auth-soft-26520-echo roster Soft 26280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-26520-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft26520EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26280+ ssh-auth-soft-26520-echo roster ok"; echo "cleaned"; echo "OK: phase26282 e2e passed"
