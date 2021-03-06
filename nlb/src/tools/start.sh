
#
# Tencent is pleased to support the open source community by making MSEC available.
#
# Copyright (C) 2016 THL A29 Limited, a Tencent company. All rights reserved.
#
# Licensed under the GNU General Public License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License. You may 
# obtain a copy of the License at
#
#     https://opensource.org/licenses/GPL-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the 
# License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific language governing permissions
# and limitations under the License.
#



#!/bin/sh

if [ $# -lt 2 ] ; then
	echo "argument number invalid"
	exit
fi

AGENT_HOME=/msec/agent
ZK_SERV="$1:8972"
NET_INTF=$2

echo "starting nlb..."
cd $AGENT_HOME/nlb/bin/; ./nlbagent  $ZK_SERV -m mix  -i $NET_INTF
sleep 1
cnt=`ps aux|grep nlbagent|grep -v grep|wc -l`
if [ $cnt -gt 0 ]; then
	echo "nlb agent started"
	ps aux|grep nlbagent|grep -v grep
else
	echo "failed to start nlb agent"
fi

