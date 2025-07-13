class AssigningError < StandardError
    class AlreadyUsedOnUser < AssigningError; end
    class AlreadyUsedOnOtherUser < AssigningError; end
end