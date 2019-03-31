<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 19:01
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class BoolFieldValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class BoolFieldValueEntity extends FieldValueEntity
{
    /**
     * @var bool|null
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $value;

    public function __construct(FieldEntity $field, ?bool $value = null)
    {
        parent::__construct($field);
        $this->value = $value;
    }

    /**
     * @return bool|null
     */
    public function getValue(): ?bool
    {
        return $this->value;
    }

    /**
     * @param bool|null $value
     */
    public function setValue(?bool $value): void
    {
        $this->value = $value;
    }


}
