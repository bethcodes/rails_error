Rails.application.routes.draw do
  get '/supported', to: 'application#default', constraints: ->() {true}
  get '/unsupported', to: 'application#default', constraints: ->() {false}
  get '*will/work/', to: 'application#default', constraints: ->() {true}
  get '*will/not/work', to: 'application#default', constraints: ->() {false}
  get '*error', to: 'application#default', constraints: ->() {false}
end
