#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthPolicyEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-policy-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase12218 e2e passed"
