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
  e2e-phase71
  e2e-phase72
  e2e-phase73
  e2e-phase74
  e2e-phase75
  e2e-phase76
  e2e-phase77
  e2e-phase78
  e2e-phase79
  e2e-phase80
  e2e-phase81
  e2e-phase82
  e2e-phase83
  e2e-phase84
  e2e-phase85
  e2e-phase86
  e2e-phase87
  e2e-phase88
  e2e-phase89
  e2e-phase90
  e2e-phase91
  e2e-phase92
  e2e-phase93
  e2e-phase94
  e2e-phase95
  e2e-phase96
  e2e-phase97
  e2e-phase98
  e2e-phase99
  e2e-phase100
  e2e-phase101
  e2e-phase102
  e2e-phase103
  e2e-phase104
  e2e-phase105
  e2e-phase106
  e2e-phase107
  e2e-phase108
  e2e-phase109
  e2e-phase110
  e2e-phase111
  e2e-phase112
  e2e-phase113
  e2e-phase114
  e2e-phase115
  e2e-phase116
  e2e-phase117
  e2e-phase118
  e2e-phase119
  e2e-phase120
  e2e-phase121
  e2e-phase122
  e2e-phase123
  e2e-phase124
  e2e-phase125
  e2e-phase126
  e2e-phase127
  e2e-phase128
  e2e-phase129
  e2e-phase130
  e2e-phase131
  e2e-phase132
  e2e-phase133
  e2e-phase134
  e2e-phase135
  e2e-phase136
  e2e-phase137
  e2e-phase138
  e2e-phase139
  e2e-phase140
  e2e-phase141
  e2e-phase142
  e2e-phase143
  e2e-phase144
  e2e-phase145
  e2e-phase146
  e2e-phase147
  e2e-phase148
  e2e-phase149
  e2e-phase150
  e2e-phase151
  e2e-phase152
  e2e-phase153
  e2e-phase154
  e2e-phase155
  e2e-phase156
  e2e-phase157
  e2e-phase158
  e2e-phase159
  e2e-phase160
  e2e-phase161
  e2e-phase162
  e2e-phase163
  e2e-phase164
  e2e-phase165
  e2e-phase166
  e2e-phase167
  e2e-phase168
  e2e-phase169
  e2e-phase170
  e2e-phase171
  e2e-phase172
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
