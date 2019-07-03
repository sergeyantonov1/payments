class Donate
  include Interactor::Organizer

  organize SavePayer,
    MakePayment,
    SaveTransaction
end
