;; League Administrator Verification Contract
;; Manages league administrators and their permissions

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_ADMIN (err u101))
(define-constant ERR_NOT_ADMIN (err u102))

;; Data storage
(define-map administrators principal bool)
(define-data-var admin-count uint u0)

;; Initialize contract owner as first admin
(map-set administrators CONTRACT_OWNER true)
(var-set admin-count u1)

;; Add new administrator
(define-public (add-administrator (new-admin principal))
  (begin
    (asserts! (is-administrator tx-sender) ERR_UNAUTHORIZED)
    (asserts! (not (is-administrator new-admin)) ERR_ALREADY_ADMIN)
    (map-set administrators new-admin true)
    (var-set admin-count (+ (var-get admin-count) u1))
    (ok true)
  )
)

;; Remove administrator
(define-public (remove-administrator (admin principal))
  (begin
    (asserts! (is-administrator tx-sender) ERR_UNAUTHORIZED)
    (asserts! (is-administrator admin) ERR_NOT_ADMIN)
    (asserts! (not (is-eq admin CONTRACT_OWNER)) ERR_UNAUTHORIZED)
    (map-delete administrators admin)
    (var-set admin-count (- (var-get admin-count) u1))
    (ok true)
  )
)

;; Check if principal is administrator
(define-read-only (is-administrator (user principal))
  (default-to false (map-get? administrators user))
)

;; Get admin count
(define-read-only (get-admin-count)
  (var-get admin-count)
)
