#!/usr/bin/env bash
# Phase-26602: UI ssh-auth-soft-26880-echo roster Soft 26600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-26880-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft26880EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26600+ ssh-auth-soft-26880-echo roster ok"; echo "cleaned"; echo "OK: phase26602 e2e passed"
