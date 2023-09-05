//
//  main.cpp
//  practice_C++
//
//  Created by 이동욱 on 2023/09/21.
//
// 백준 2178번 - 미로 탐색
// 문제 : 1 과 0으로 이루어진 미로의 (0, 0)좌표에서 (n-1, m-1)좌표까지 최단 거리를 구하는 문제.
// 풀이 : 노드 간 가중치가 1로 일정하므로 BFS를 이용해 풀었음.

#include<bits/stdc++.h>
using namespace std;

const int MAX = 104;
const int DIR = 4;
int n, m;
char mp[MAX][MAX];
int visited[MAX][MAX];
int my[DIR] = {1, 0, -1, 0}, mx[DIR] = {0, 1, 0, -1};

//bfs() 함수
void bfs (int y, int x){
    queue<pair<int, int>> q;
    q.push({y, x});
    visited[y][x] = 1;
    
    while(q.size()){
        for(int i = 0; i < DIR; i++){ // 4방향 탐색
            int ny = q.front().first + my[i];
            int nx = q.front().second + mx[i];
            if(ny < 0 || ny >= n || nx < 0 || nx >= m || visited[ny][nx] || mp[ny][nx] == '0') continue;
            q.push({ny, nx});
            visited[ny][nx] = visited[q.front().first][q.front().second] + 1;
        }
        if(!q.empty()) q.pop();
    }
    return;
}

int main(){
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    //입력
    cin >> n >> m;
    
    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            cin >> mp[i][j];
        }
    }
    
    //수행
    bfs(0, 0);
    
    //출력
    cout << visited[n-1][m-1] << "\n";
    
    return 0;
}
