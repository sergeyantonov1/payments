module AuthenticationViaProviders
  class PrepareData
    include Interactor

    UNSUPPORTED_PROVIDER_ERROR_MESSAGE = "Sorry, provider unsupported!".freeze

    delegate :auth_params, to: :context
    delegate :provider, to: :auth_params

    def call
      context.user_params = prepared_data.user_params
      context.provider_params = prepared_data.provider_params
    end

    private

    def prepared_data
      @prepared_data ||= prepare_data_strategy.call(auth_params: auth_params)
    end

    def prepare_data_strategy
      [
        "AuthenticationViaProviders",
        "Preparers",
        provider.classify
      ].join("::").constantize

    rescue NameError
      context.fail!(error: UNSUPPORTED_PROVIDER_ERROR_MESSAGE)
    end
  end
end
