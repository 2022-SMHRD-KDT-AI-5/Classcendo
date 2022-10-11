from flask import Flask # 플라스크 클래스 임포트
from flask import request, redirect, make_response
from flask_cors import CORS
import pandas as pd
import numpy as np
import joblib
from konlpy.tag import Kkma
kkma = Kkma()
import json
import pickle


def classcendo1(text):
    df = pd.DataFrame(kkma.pos(text), columns=['morphs','tag'])
    df.set_index('tag', inplace=True)
    # 명사, 동사, 형용사 있을 때 조건 코드
    if('VV' in df.index)| ('VA'in df.index)| ('NNG' in df.index):
        return df.loc[df.index.intersection(['VV','VA','NNG']), 'morphs'].values
    # 없을 때 빈 리스트 반환
    else:
        return []
def classcendo2(text):
    df = pd.DataFrame(kkma.pos(text), columns=['morphs','tag'])
    df.set_index('tag', inplace=True)
    # 명사, 동사, 형용사 있을 때 조건 코드
    if('VV' in df.index)| ('VA'in df.index)| ('NNG' in df.index):
        return df.loc[df.index.intersection(['VV','VA','NNG']), 'morphs'].values
    # 없을 때 빈 리스트 반환
    else:
        return []
def classcendo3(text):
    df = pd.DataFrame(kkma.pos(text), columns=['morphs','tag'])
    df.set_index('tag', inplace=True)
    # 명사, 동사, 형용사 있을 때 조건 코드
    if('VV' in df.index)| ('VA'in df.index)| ('NNG' in df.index):
        return df.loc[df.index.intersection(['VV','VA','NNG']), 'morphs'].values
    # 없을 때 빈 리스트 반환
    else:
        return []
def classcendo4(text):
    df = pd.DataFrame(kkma.pos(text), columns=['morphs','tag'])
    df.set_index('tag', inplace=True)
    # 명사, 동사, 형용사 있을 때 조건 코드
    if('VV' in df.index)| ('VA'in df.index)| ('NNG' in df.index):
        return df.loc[df.index.intersection(['VV','VA','NNG']), 'morphs'].values
    # 없을 때 빈 리스트 반환
    else:
        return []

app = Flask(__name__) # 내장변수 name을 이용해 서버를 구동시키는 객체 생성
CORS(app)

@app.route("/", methods=["GET",'POST'])

def predict_survived() :
    
    if request.method == 'POST' :# POST 방식일 경우
        # 학생 행동특성 및 종합의견
        std_sentence = request.form['record']
        print(std_sentence)
        #  1번 성향 직업
        job_1 = pd.read_csv('1번직업.csv', encoding='euc-kr')
        #  2번 성향 직업
        job_2 = pd.read_csv('2번직업.csv', encoding='euc-kr')
        #  3번 성향 직업
        job_3 = pd.read_csv('3번직업.csv', encoding='euc-kr')
        #  4번 성향 직업
        job_4 = pd.read_csv('4번직업.csv', encoding='euc-kr')

        # 1번 직업 성향 리스트 만들기
        job_1_lst = job_1['성향'].tolist()
        job_1_lst_p = []
        for i in range(len(job_1_lst)):
            job_1_lst_i = job_1_lst[i].split(',')
            job_1_lst_p.extend(job_1_lst_i)
        #  1번 직업 성향 중복 제거
        list(set(job_1_lst_p))

        #  2번 직업
        job_2_lst = job_2['성향'].tolist()
        job_2_lst_p = []
        for i in range(len(job_2_lst)):
            job_2_lst_i = job_2_lst[i].split(',')
            job_2_lst_p.extend(job_2_lst_i)
        list(set(job_2_lst_p))

        #  3번 직업
        job_3_lst = job_3['성향'].tolist()
        job_3_lst_p = []
        for i in range(len(job_3_lst)):
            job_3_lst_i = job_3_lst[i].split(',')
            job_3_lst_p.extend(job_3_lst_i)
        list(set(job_3_lst_p))

        #  4번 직업
        job_4_lst = job_4['성향'].tolist()
        job_4_lst_p = []
        for i in range(len(job_4_lst)):
            job_4_lst_i = job_4_lst[i].split(',')
            job_4_lst_p.extend(job_4_lst_i)
        list(set(job_4_lst_p))

        #  1번역량 가중치 계산하기
        with open('./logi_model1.pkl','rb') as f:
            logi_model1 = joblib.load(f)
        # logi_model1 = joblib.load('./logi_model1.joblib')
        with open('./final_tfidf_vect.pkl', 'rb') as f:
            final_tfidf_vect1 = joblib.load(f)
        # final_tfidf_vect1 = joblib.load('./final_tfidf_vect1.joblib')
        std_sentence1_re = final_tfidf_vect1.transform([std_sentence])
        std_sentence1_re.toarray()[0,:][std_sentence1_re.toarray()[0,:]>0]
        std_sentence1 = pd.DataFrame(std_sentence1_re.toarray())
        std_sentence1.iloc[0,:][std_sentence1.iloc[0,:]>0].keys()[0]

        std_s_lst1 = []
        for i in range(len(std_sentence1.iloc[0,:][std_sentence1.iloc[0,:]>0].keys())):
            std_s_lst1.append(std_sentence1.iloc[0,:][std_sentence1.iloc[0,:]>0].keys()[i])

        pre1 = logi_model1.predict(std_sentence1_re)
        # 단어사전
        voc1 = pd.DataFrame(final_tfidf_vect1.vocabulary_.keys(), index = final_tfidf_vect1.vocabulary_.values())
        # 가중치
        result1 = pd.DataFrame(logi_model1.coef_.T, columns =['Weight'] )
        result1 = pd.concat([result1, voc1.sort_index()], axis=1)
        re1_1 = []
        re1_2 = []
        for i in std_s_lst1:
            re1_1.append(result1.iloc[i,:][0])
            re1_2.append(result1.iloc[i,:]['Weight'])
        re1 = pd.DataFrame(re1_2, re1_1)
        re1 = re1.reset_index()
        re1.columns=['index','Weight']

        #  2번역량 가중치 계산하기
        with open('./logi_model2.pkl','rb') as f:
            logi_model2 = joblib.load(f)
        # logi_model2 = joblib.load('./logi_model2.pkl')
        with open('./final_tfidf_vect2.pkl','rb') as f:
            final_tfidf_vect2 = joblib.load(f)
        # final_tfidf_vect2 = joblib.load('./final_tfidf_vect2.pkl')
        std_sentence2_re = final_tfidf_vect2.transform([std_sentence])
        std_sentence2_re.toarray()[0,:][std_sentence2_re.toarray()[0,:]>0]
        std_sentence2 = pd.DataFrame(std_sentence2_re.toarray())
        std_sentence2.iloc[0,:][std_sentence2.iloc[0,:]>0].keys()[0]

        std_s_lst2 = []
        for i in range(len(std_sentence2.iloc[0,:][std_sentence2.iloc[0,:]>0].keys())):
            std_s_lst2.append(std_sentence2.iloc[0,:][std_sentence2.iloc[0,:]>0].keys()[i])

        pre2 = logi_model2.predict(std_sentence2_re)
        # 단어사전
        voc2 = pd.DataFrame(final_tfidf_vect2.vocabulary_.keys(), index = final_tfidf_vect2.vocabulary_.values())
        # 가중치
        result2 = pd.DataFrame(logi_model2.coef_.T, columns =['Weight'] )
        result2 = pd.concat([result2, voc2.sort_index()], axis=1)
        re2_1 = []
        re2_2 = []
        for i in std_s_lst2:
            re2_1.append(result2.iloc[i,:][0])
            re2_2.append(result2.iloc[i,:]['Weight'])
        re2 = pd.DataFrame(re2_2, re2_1)
        re2 = re2.reset_index()
        re2.columns=['index','Weight']

        #  3번역량 가중치 계산하기
        with open('./logi_model3.pkl','rb') as f:
            logi_model3 = joblib.load(f)
        # logi_model3 = joblib.load('./logi_model3.pkl')
        with open('./final_tfidf_vect3.pkl', 'rb') as f:
            final_tfidf_vect3 = joblib.load(f)
        # final_tfidf_vect3 = joblib.load('./final_tfidf_vect3.pkl')
        std_sentence3_re = final_tfidf_vect3.transform([std_sentence])
        std_sentence3_re.toarray()[0,:][std_sentence3_re.toarray()[0,:]>0]
        std_sentence3 = pd.DataFrame(std_sentence3_re.toarray())
        std_sentence3.iloc[0,:][std_sentence3.iloc[0,:]>0].keys()[0]

        std_s_lst3 = []
        for i in range(len(std_sentence3.iloc[0,:][std_sentence3.iloc[0,:]>0].keys())):
            std_s_lst3.append(std_sentence3.iloc[0,:][std_sentence3.iloc[0,:]>0].keys()[i])

        pre3 = logi_model3.predict(std_sentence3_re)
        # 단어사전
        voc3 = pd.DataFrame(final_tfidf_vect3.vocabulary_.keys(), index = final_tfidf_vect3.vocabulary_.values())
        # 가중치
        result3 = pd.DataFrame(logi_model3.coef_.T, columns =['Weight'] )
        result3 = pd.concat([result3, voc3.sort_index()], axis=1)
        re3_1 = []
        re3_2 = []
        for i in std_s_lst3:
            re3_1.append(result3.iloc[i,:][0])
            re3_2.append(result3.iloc[i,:]['Weight'])
        re3 = pd.DataFrame(re3_2, re3_1)
        re3 = re3.reset_index()
        re3.columns=['index','Weight']

        #  4번역량 가중치 계산하기
        # logi_model4 = joblib.load('./logi_model4.pkl')
        with open('./logi_model4.pkl','rb') as f:
            logi_model4 = joblib.load(f)
        # final_tfidf_vect4 = joblib.load('./final_tfidf_vect4.pkl')
        with open('./final_tfidf_vect4.pkl','rb') as f:
            final_tfidf_vect4 = joblib.load(f)
        std_sentence4_re = final_tfidf_vect4.transform([std_sentence])
        std_sentence4_re.toarray()[0,:][std_sentence4_re.toarray()[0,:]>0]
        std_sentence4 = pd.DataFrame(std_sentence4_re.toarray())
        std_sentence4.iloc[0,:][std_sentence4.iloc[0,:]>0].keys()[0]

        std_s_lst4 = []
        for i in range(len(std_sentence4.iloc[0,:][std_sentence4.iloc[0,:]>0].keys())):
            std_s_lst4.append(std_sentence4.iloc[0,:][std_sentence4.iloc[0,:]>0].keys()[i])

        pre4 = logi_model4.predict(std_sentence4_re)
        # 단어사전
        voc4 = pd.DataFrame(final_tfidf_vect4.vocabulary_.keys(), index = final_tfidf_vect4.vocabulary_.values())
        # 가중치
        result4 = pd.DataFrame(logi_model4.coef_.T, columns =['Weight'] )
        result4 = pd.concat([result4, voc4.sort_index()], axis=1)
        re4_1 = []
        re4_2 = []
        for i in std_s_lst4:
            re4_1.append(result4.iloc[i,:][0])
            re4_2.append(result4.iloc[i,:]['Weight'])
        re4 = pd.DataFrame(re4_2, re4_1)
        re4 = re4.reset_index()
        re4.columns=['index','Weight']

        #  특성별 확률
        pre1_per = f'{logi_model1.predict_proba(std_sentence1_re).max()*100:.2f}'
        pre2_per = f'{logi_model2.predict_proba(std_sentence2_re).max()*100:.2f}'
        pre3_per = f'{logi_model3.predict_proba(std_sentence3_re).max()*100:.2f}'
        pre4_per = f'{logi_model4.predict_proba(std_sentence4_re).max()*100:.2f}'

        #  pre1값이 0이라면
        if pre1 == 0:
            pre1_per = 100 - float(pre1_per)
        else:
            pre1_per = pre1_per
        #  pre2값이 0이라면
        if pre2 == 0:
            pre2_per = 100 - float(pre2_per)
        else:
            pre2_per = pre2_per
        #  pre3값이 0이라면
        if pre3 == 0:
            pre3_per = 100 - float(pre3_per)
        else:
            pre3_per = pre3_per
        #  pre4값이 0이라면
        if pre4 == 0:
            pre4_per = 100 - float(pre4_per)
        else:
            pre4_per = pre4_per


        # 성향이 가장 높고 가중치가 가장 높은 단어가 포함되어있는 성향과 직업 찾기
        if pre1_per > pre2_per and pre1_per > pre3_per and pre1_per > pre4_per:
            #  1번 특성
            #  성향별 가중치 높은 단어 직업성향이랑 비교하기
            tendency1 = re1 # 가중치단어
            tendency1_1 = tendency1[tendency1['index'].isin(job_1_lst_p)].reset_index(drop=True)
            tendency1_1= tendency1_1.sort_values(by=['Weight'],ascending=False)
            if tendency1_1.empty:
                tendency1_1 = '없습니다'
            else:
                tendency1_1 = tendency1_1['index'].iloc[0]
            tendency1_1

            if tendency1_1 == '없습니다':
                job = 0
            else:
                job_1_1_1= job_1[job_1['성향'].str.contains(tendency1_1)]
                job_1_1_1 = job_1_1_1['직업']
                job_1_1_1 = job_1_1_1.reset_index()['직업']
                job = ''
                for i in range(len(job_1_1_1)):
                    job += job_1_1_1[i] + ','
            print(tendency1_1)
            
            
        elif pre2_per > pre1_per and pre2_per > pre3_per and pre2_per > pre4_per:
            # 2번 특성
            #  성향별 가중치 높은 단어 직업성향이랑 비교하기
            tendency2 = re2
            tendency2_1 = tendency2[tendency2['index'].isin(job_2_lst_p)].reset_index(drop=True)
            tendency2_1= tendency2_1.sort_values(by=['Weight'],ascending=False)
            if tendency2_1.empty:
                tendency2_1 = '없습니다'
            else:
                tendency2_1 = tendency2_1['index'].iloc[0]
            tendency2_1

            if tendency2_1 == '없습니다':
                job = 0
            else:
                job_2_1_1 = job_2[job_2['성향'].str.contains(tendency2_1)]
                job_2_1_1 = job_2_1_1.reset_index()['직업']
                job = ''
                for i in range(len(job_2_1_1)):
                    job += job_2_1_1[i] + ','
            print(tendency2_1)

            
        elif pre3_per > pre1_per and pre3_per > pre2_per and pre3_per > pre4_per:
            # 3번 특성
            #  성향별 가중치 높은 단어 직업성향이랑 비교하기
            tendency3 = re3
            tendency3_1 = tendency3[tendency3['index'].isin(job_3_lst_p)].reset_index(drop=True)
            tendency3_1= tendency3_1.sort_values(by=['Weight'],ascending=False)
            if tendency3_1.empty:
                tendency3_1 = '없습니다'
            else:
                tendency3_1 = tendency3_1['index'].iloc[0]
            tendency3_1

            if tendency3_1 == '없습니다':
                job = 0
            else:
                job_3_1_1 = job_3[job_3['성향'].str.contains(tendency3_1)]
                job_3_1_1 = job_3_1_1.reset_index()['직업']
                job = ''
                for i in range(len(job_3_1_1)):
                    job += job_3_1_1[i] + ','   
            print(tendency3_1)

            
        elif pre4_per > pre1_per and pre4_per > pre2_per and pre4_per > pre3_per:
            # 4번 특성
            #  성향별 가중치 높은 단어 직업성향이랑 비교하기
            tendency4 = re4
            tendency4_1 = tendency4[tendency4['index'].isin(job_4_lst_p)].reset_index(drop=True)
            tendency4_1= tendency4_1.sort_values(by=['Weight'],ascending=False)
            if tendency4_1.empty:
                tendency4_1 = '없습니다'
            else:
                tendency4_1 = tendency4_1['index'].iloc[0]
            tendency4_1

            if tendency4_1 == '없습니다':
                job = 0
            else:
                job_4_1_1 = job_4[job_4['성향'].str.contains(tendency4_1)]
                job_4_1_1 = job_4_1_1.reset_index()['직업']
                job = ''
                for i in range(len(job_4_1_1)):
                    job += job_4_1_1[i] + ','    
            print(tendency4_1)

        
        
        
        
        print(pre1_per)
        print(pre2_per)
        print(pre3_per)
        print(pre4_per)
        print(job)

        return [pre1_per, pre2_per, pre3_per, pre4_per, job]
       
    
    else : # GET 방식일 경우
        # 넘어온 값을 전처리
        return "어서오세요2."

def build_preflight_response():
    response = make_response()
    response.headers.add("Access-Control-Allow-Origin", "*")
    response.headers.add('Access-Control-Allow-Headers', "*")
    response.headers.add('Access-Control-Allow-Methods', "*")
    return response
    
def build_actual_response(response):
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

if __name__ == "__main__" : # .py 파일에서 main함수 역할
    app.run(host="localhost", port="9000") # 9000번 포트로 서버 구동
    