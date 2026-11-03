#!/usr/bin/env bash
# Run the full local WebUI E2E suite (typecheck + phases).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

echo "== frontend typecheck =="
( cd webui/frontend && npm run typecheck )

fail=0
scripts=(
  e2e-local
  e2e-phase2
  e2e-phase3
  e2e-phase4
  e2e-phase5
  e2e-phase6
  e2e-phase7
  e2e-phase8
  e2e-phase9
  e2e-phase10
  e2e-phase11
  e2e-phase12
  e2e-phase13
  e2e-phase14
  e2e-phase15
  e2e-phase16
  e2e-phase17
  e2e-phase18
  e2e-phase19
  e2e-phase20
  e2e-phase21
  e2e-phase22
  e2e-phase23
  e2e-phase24
  e2e-phase25
  e2e-phase26
  e2e-phase27
  e2e-phase28
  e2e-phase29
  e2e-phase30
  e2e-phase31
  e2e-phase32
  e2e-phase33
  e2e-phase34
  e2e-phase35
  e2e-phase36
  e2e-phase37
  e2e-phase38
  e2e-phase39
  e2e-phase40
  e2e-phase41
  e2e-phase42
  e2e-phase43
  e2e-phase44
  e2e-phase45
  e2e-phase46
  e2e-phase47
  e2e-phase48
  e2e-phase49
  e2e-phase50
  e2e-phase51
  e2e-phase52
  e2e-phase53
  e2e-phase54
  e2e-phase55
  e2e-phase56
  e2e-phase57
  e2e-phase58
  e2e-phase59
  e2e-phase60
  e2e-phase61
  e2e-phase62
  e2e-phase63
  e2e-phase64
  e2e-phase65
  e2e-phase66
  e2e-phase67
  e2e-phase68
  e2e-phase69
  e2e-phase70
)
for s in "${scripts[@]}"; do
  script="webui/scripts/${s}.sh"
  if [[ ! -x "$script" ]]; then
    echo "SKIP $s (missing)"
    continue
  fi
  echo "===== $s ====="
  if bash "$script"; then
    echo "OK $s"
  else
    echo "FAIL $s"
    fail=1
    break
  fi
done

if [[ "$fail" -ne 0 ]]; then
  echo "E2E suite FAILED"
  exit 1
fi
echo "OK: full e2e suite passed"
