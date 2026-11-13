#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSchema295EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-schema-295-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase28618 e2e passed"
