FROM ruby:3.4-slim

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  libffi-dev \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev \
  git \
  && rm -rf /var/lib/apt/lists/*


WORKDIR /app

COPY . .
RUN bundle install


EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "--host", "0.0.0.0", "--port", "4000"]
