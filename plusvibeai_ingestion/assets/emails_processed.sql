/* @bruin

name: plusvibeai.emails_processed
type: bq.sql
description: "Processed email data with enhanced metrics and classifications"
owner: data-team

depends:
  - plusvibeai.emails

tags:
  - plusvibeai
  - emails
  - processed
  - transformation

columns:
  - name: ID
    type: STRING
    description: "Unique identifier for the email"
    primary_key: true
  - name: SUBJECT
    type: STRING
    description: "Email subject line"
  - name: FROM_ADDRESS_EMAIL
    type: STRING
    description: "Sender email address"
  - name: TO_ADDRESS_EMAIL_LIST
    type: STRING
    description: "Recipient email addresses"
  - name: DIRECTION
    type: STRING
    description: "Email direction (IN/OUT)"
  - name: IS_UNREAD
    type: INTEGER
    description: "Whether email is unread (1=unread, 0=read)"
  - name: sender_domain
    type: STRING
    description: "Domain of sender email"
  - name: subject_length
    type: INTEGER
    description: "Length of email subject"
  - name: email_type
    type: STRING
    description: "Classification of email type"
  - name: TIMESTAMP_CREATED
    type: TIMESTAMP
    description: "Email creation timestamp"
  - name: SOURCE_MODIFIED_AT
    type: TIMESTAMP
    description: "Source modification timestamp"
  - name: is_incoming
    type: BOOLEAN
    description: "Whether email is incoming"
  - name: is_read
    type: BOOLEAN
    description: "Whether email was read"
  - name: THREAD_ID
    type: STRING
    description: "Email thread identifier"
  - name: CAMPAIGN_ID
    type: STRING
    description: "Associated campaign ID"
  - name: LEAD_ID
    type: STRING
    description: "Associated lead ID"

@bruin */

SELECT 
    ID,
    SUBJECT,
    FROM_ADDRESS_EMAIL,
    TO_ADDRESS_EMAIL_LIST,
    DIRECTION,
    IS_UNREAD,
    
    -- Extract domain from sender email
    REGEXP_EXTRACT(FROM_ADDRESS_EMAIL, r'@(.+)$') AS sender_domain,
    
    -- Calculate subject length
    LENGTH(SUBJECT) AS subject_length,
    
    -- Classify email type based on subject
    CASE 
        WHEN LOWER(SUBJECT) LIKE '%welcome%' THEN 'Welcome'
        WHEN LOWER(SUBJECT) LIKE '%follow%' OR LOWER(SUBJECT) LIKE '%follow-up%' THEN 'Follow-up'
        WHEN LOWER(SUBJECT) LIKE '%newsletter%' THEN 'Newsletter'
        WHEN LOWER(SUBJECT) LIKE '%promo%' OR LOWER(SUBJECT) LIKE '%discount%' THEN 'Promotional'
        WHEN LOWER(SUBJECT) LIKE '%reminder%' THEN 'Reminder'
        WHEN LOWER(SUBJECT) LIKE '%thank%' THEN 'Thank You'
        WHEN LOWER(SUBJECT) LIKE '%re:%' THEN 'Reply'
        ELSE 'General'
    END AS email_type,
    
    TIMESTAMP_CREATED,
    SOURCE_MODIFIED_AT,
    
    -- Check if email is incoming or outgoing
    CASE 
        WHEN DIRECTION = 'IN' THEN TRUE
        ELSE FALSE
    END AS is_incoming,
    
    -- Check if email was read
    CASE 
        WHEN IS_UNREAD = 1 THEN FALSE
        ELSE TRUE
    END AS is_read,
    
    -- Email thread information
    THREAD_ID,
    CAMPAIGN_ID,
    LEAD_ID

FROM `plusvibeai.emails`
WHERE TIMESTAMP_CREATED IS NOT NULL
