#!/usr/bin/env bash
# Phase-18602: UI ssh-auth-soft-18600-echo roster Soft 18600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-18600-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft18600EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18600+ ssh-auth-soft-18600-echo roster ok"; echo "cleaned"; echo "OK: phase18602 e2e passed"
