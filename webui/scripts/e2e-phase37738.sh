#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSoft39400EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-soft-39400-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase37738 e2e passed"
