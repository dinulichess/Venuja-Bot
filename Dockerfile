FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .

#ADD /engine/ .
#RUN rm -r engine

# If you want to run any other commands use "RUN" before.

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full

RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z
Run 7z e Cerebellum3Merge.bin.7z
RUN rm Cerebellum3Merge.bin.7z
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Syzygy/-/archive/MEGA/Syzygy-MEGA.zip" -O syzygy-MEGA.zip
RUN wget --no-check-certificate "https://abrok.eu/stockfish/builds/5b47b4e6c04719e66559efe91e505569e0f7aafa/linux64modern/stockfish_21091708_x64_modern.zip" -O chess-engine.zip
RUN wget --no-check-certificate "https://tests.stockfishchess.org/api/nn/nn-46832cfbead3.nnue" -O nn-938525872610.nnue
RUN 7z e chess-engine.zip && rm chess-engine.zip && mv stockfish* chess-engine

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x chess-engine
# Engine name is here ^^^^^^

CMD python3 run.py
