"""
author      : 노민철
Description : MySQL과 Python Data의 CRUD for Flutter
Date        : 2024-11-26
"""

from fastapi import FastAPI
import pymysql
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# CORS 설정
app.add_middleware(
    CORSMiddleware,
    allow_origins=['*'],    # 모든 도메인 허용
    allow_credentials=True,
    allow_methods=['*'],    # 모든 http 메서드 허용
    allow_headers=['*'],    # 모든 헤더 허용
)

# MySQL Connection
def connect():
    conn = pymysql.connect(
        host='127.0.0.1',
        user='root',
        password='qwer1234',
        db='flutter',
        charset='utf8',
    )
    return conn

@app.get("/select")
async def select():
    conn = connect()
    curs = conn.cursor()
    sql ="SELECT bId, bName, bTitle, bContent, bDate FROM board ORDER BY bDate desc"
    curs.execute(sql)
    rows = curs.fetchall()
    conn.close()
    print(rows)
    # 컬럼 이름
    column_names = [desc[0] for desc in curs.description]
    # 결과를 Dictionary형태로 변환
    results = [dict(zip(column_names, row)) for row in rows]
    print(results)
    return {'results':results}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)